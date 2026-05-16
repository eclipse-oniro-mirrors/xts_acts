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
import AbilityStage from "@ohos.app.ability.AbilityStage";
import AbilityLifecycleCallback from '@ohos.app.ability.AbilityLifecycleCallback';
export default class MyAbilityStage extends AbilityStage {
  onCreate() {
    console.log("[Demo] MyAbilityStage onCreate")
    console.log("[Demo] MyAbilityStage stagecontext: " + JSON.stringify(this.context));
    globalThis.list = [];
    let AbilityLifecycleCallback:AbilityLifecycleCallback = {
      onAbilityCreate(ability) {
        console.log("[Demo] AbilityLifecycleCallback onAbilityCreate ability:"
          + JSON.stringify(ability));
        let abilityname = ability.context.abilityInfo.name;
        console.log("[Demo] AbilityLifecycleCallback onAbilityCreate abilityname:"
          + JSON.stringify(abilityname));
        console.log("[Demo] " + abilityname + " onAbilityCreate");
        globalThis.list.push(abilityname + " onAbilityCreate");
        console.log("[Demo] 1listKey:" + JSON.stringify(globalThis.list));
      },
      onWindowStageCreate(ability, windowStage) {
        console.log("[Demo] AbilityLifecycleCallback onWindowStageCreate ability:"
          + JSON.stringify(ability));
        let abilityname = ability.context.abilityInfo.name;
        console.log("[Demo] AbilityLifecycleCallback onWindowStageCreate abilityname:"
          + JSON.stringify(abilityname));
        console.log("[Demo] " + abilityname + " onWindowStageCreate");
        globalThis.list.push(abilityname + " onWindowStageCreate");
        console.log("[Demo] 2listKey:" + JSON.stringify(globalThis.list));
      },
      onWindowStageActive(ability, windowStage) {
        let abilityname = ability.context.abilityInfo.name;
        console.log(abilityname + " onWindowStageActive");
      },
      onWindowStageInactive(ability, windowStage) {
        let abilityname = ability.context.abilityInfo.name;
        console.log(abilityname + " onWindowStageInactive");
      },
      onWindowStageDestroy(ability, windowStage) {
        console.log("[Demo] AbilityLifecycleCallback onWindowStageDestroy ability:"
          + JSON.stringify(ability));
        let abilityname = ability.context.abilityInfo.name;
        console.log("[Demo] AbilityLifecycleCallback onWindowStageDestroy abilityname:"
          + JSON.stringify(abilityname));
        console.log("[Demo] " + abilityname + " onWindowStageDestroy");
        globalThis.list.push(abilityname + " onWindowStageDestroy");
        console.log("[Demo] 3listKey:" + JSON.stringify(globalThis.list));
      },
      onAbilityDestroy(ability) {
        console.log("[Demo] AbilityLifecycleCallback onAbilityDestroy ability:"
          + JSON.stringify(ability));
        let abilityname = ability.context.abilityInfo.name;
        console.log("[Demo] AbilityLifecycleCallback onAbilityDestroy abilityname:"
          + JSON.stringify(abilityname));
        console.log("[Demo] " + abilityname + " onAbilityDestroy");
        globalThis.list.push(abilityname + " onAbilityDestroy");
        console.log("[Demo] 4listKey:" + JSON.stringify(globalThis.list));
      },
      onAbilityForeground(ability) {
        console.log("[Demo] AbilityLifecycleCallback onAbilityForeground ability:"
          + JSON.stringify(ability));
        let abilityname = ability.context.abilityInfo.name;
        console.log("[Demo] AbilityLifecycleCallback onAbilityForeground abilityname:"
          + JSON.stringify(abilityname));
        console.log("[Demo] " + abilityname + " onAbilityForeground");
        globalThis.list.push(abilityname + " onAbilityForeground");
        console.log("[Demo] 5listKey:" + JSON.stringify(globalThis.list));
      },
      onAbilityBackground(ability) {
        console.log("[Demo] AbilityLifecycleCallback onAbilityBackground ability:"
          + JSON.stringify(ability));
        let abilityname = ability.context.abilityInfo.name;
        console.log("[Demo] AbilityLifecycleCallback onAbilityBackground abilityname:"
          + JSON.stringify(abilityname));
        console.log("[Demo] " + abilityname + " onAbilityBackground");
        globalThis.list.push(abilityname + " onAbilityBackground");
        console.log("[Demo] 6listKey:" + JSON.stringify(globalThis.list));
      },
      onAbilityContinue(ability) {
        console.log("[Demo] AbilityLifecycleCallback onAbilityContinue ability:"
          + JSON.stringify(ability));
        let abilityname = ability.context.abilityInfo.name;
        console.log("[Demo] AbilityLifecycleCallback onAbilityContinue abilityname:"
          + JSON.stringify(abilityname));
        console.log("[Demo] " + abilityname + " onAbilityContinue");
        globalThis.list.push(abilityname + " onAbilityContinue");
        console.log("[Demo] 7listKey:" + JSON.stringify(globalThis.list));
      }
    }
    globalThis.applicationContext = this.context.getApplicationContext();
    console.log("[Demo] stage applicationContext: " + JSON.stringify(globalThis.applicationContext));
    let lifecycleid = globalThis.applicationContext.on('abilityLifecycle', AbilityLifecycleCallback);
    globalThis.callbackid = lifecycleid;
    console.log("[Demo] registerAbilityLifecycleCallback number: " + JSON.stringify(lifecycleid));
  }
}